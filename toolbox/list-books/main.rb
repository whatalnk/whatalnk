require 'yaml'
require 'pathname'


def translate_path_to_windows(x)
    return Pathname('C:/') + x.relative_path_from('/mnt/c')
end

def build_search_pattern(x, ext)
    return Pathname(x) + "**/*#{ext}"
end

conf = YAML.load_file("config.yaml")
conf["hondanapath"].each do |hp| 
    searach_pattern_book_pdf = build_search_pattern(hp, '.pdf')
    books = Pathname.glob(searach_pattern_book_pdf)
    books.each do |book|
        book_ = translate_path_to_windows(book)
        puts book_
    end
end
