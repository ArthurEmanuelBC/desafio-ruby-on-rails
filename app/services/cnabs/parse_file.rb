module Cnabs
  class ParseFile
    def self.call(file)
      Cnab.transaction do
        file.each_line.map do |line|
          attributes = line_attributes(line)

          Cnab.create!(attributes)
        end
      end
    end

    private

    def self.line_attributes(line)
      {
        occurence_at: DateTime.parse("#{line[1..8]}#{line[42..47]}"),
        value: line[9..18].to_f / 100,
        cpf: line[19..29],
        card_number: line[30..41],
        cnab_type: CnabType.find_by!(number: line.first),
        store: Store.find_by_name_or_create(line[62..80].strip, line[48..61].strip)
      }
    end
  end
end