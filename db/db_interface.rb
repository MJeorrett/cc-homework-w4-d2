require_relative('sql_runner')

class DbInterface

  def self.all_records( db_name, table_name )
    sql = "SELECT * FROM #{table_name}"
    results = SqlRunner.run( db_name, sql )
    return results.map { |result| result }
  end

  def self.table_names( db_name )
    sql =
      "SELECT table_name FROM information_schema.tables
      WHERE table_schema='public' AND table_type='BASE TABLE'"
    results = SqlRunner.run( db_name, sql )
    return results.map { |result| result['table_name'] }
  end

  def self.columns_data( db_name, table_name )
    sql =
    "SELECT column_name, data_type FROM #{db_name}.information_schema.columns WHERE table_name = '#{table_name}' AND column_name != 'id'"

    results = SqlRunner.run( db_name, sql )
    columns_data = []

    results.each do |result|
      column_data = {
        column: result['column_name'],
        type: result['data_type']
      }
      columns_data << column_data
    end

    return columns_data
  end

end
