require('pg')

class SqlRunner

  def self.run( dbname, sql )
    begin
      db = PG.connect( dbname: dbname, host: 'localhost' )
      result = db.exec( sql )
    ensure
      if db == nil
        raise "Sorry, SqlRunner failed to create the database connection :-("
      else
        db.close
      end
    end

    return result
  end

end
