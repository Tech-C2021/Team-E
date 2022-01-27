alias s-build="docker-compose build server"
alias s-scraper="docker-compose up server"
alias s-bash="docker exec -it scraping /bin/bash"
alias scrape="docker exec -it scraping ruby main.rb"
alias sp="docker-compose down && docker-compose build && docker-compose up"
alias c-build="docker-compose build client"
alias c-start="docker-compose up client"
alias c-bash="docker exec -it client /bin/bash"


