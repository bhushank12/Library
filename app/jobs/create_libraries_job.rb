class CreateLibrariesJob < ApplicationJob
  queue_as :default
  require 'csv'

  def perform(csv_import_id)
    # Do something later
    csv_import = CsvImport.find(csv_import_id)
    csv = CSV.parse(csv_import.data, :headers => true)
    new_csv = CSV.generate do |new_csv|
      new_csv << ['Name', 'Location', 'Status']
      csv.each do |row|
        if row["name"] != nil && row["location"] !=nil
          Library.create(name: row["name"], location: row["location"])
          new_csv << [row["name"], row["location"], "Successfully created"]
        else
          new_csv << [row["name"], row["location"], "Invalid Record"]
        end
      end
    end
    UserMailer.with(content: new_csv).send_csv_report.deliver_now
  end
end
