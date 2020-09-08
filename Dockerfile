FROM docker.elastic.co/elasticsearch/elasticsearch:7.8.0
RUN bin/elasticsearch-plugin install --batch https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-job-scheduler/opendistro-job-scheduler-1.9.0.0.zip
RUN bin/elasticsearch-plugin install --batch https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-alerting/opendistro_alerting-1.9.0.0.zip
