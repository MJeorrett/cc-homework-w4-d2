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

end
