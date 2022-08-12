create list of books
```shell
ruby main.rb > my_book_list.txt
```

open PDF file on WIndows PDF Viewer
```shell
export pdfviewer="/mnt/c/<path_to_pdf_viewer.exe>"
"$pdfviewer" $(cat my_book_list.txt | peco)
```

config.yaml
```yaml
hondanapath: 
  - /mnt/c/Users/<path_to_book_dir_1>
  - /mnt/c/Users/<path_to_book_dir_2>
```