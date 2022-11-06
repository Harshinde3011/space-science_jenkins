FROM httpd
RUN apt update -y && apt install unzip -y && apt install wget -y
# downloading packages
RUN wget https://freewebsitetemplates.com/download/space-science/space-science.zip && unzip space-science.zip -d /usr/local/apache2/ && cp -r /usr/local/apache2/space-science/upload /usr/local/apache2/htdocs/
# configuring files
RUN rm -rf   /usr/local/apache2/htdocs/index.html
