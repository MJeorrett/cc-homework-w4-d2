require_relative('sql_runner')

class DbInterface

  def self.table_names( dbname )
    sql =
      "SELECT table_name FROM information_schema.tables
      WHERE table_schema='public' AND table_type='BASE TABLE'"
    results = SqlRunner.run( dbname, sql )
    return results.map { |result| result['table_name'] }
  end

end
