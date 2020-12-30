# [2013-07-08T23:43:41.039618]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# [2013-07-08T23:43:41.040551]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# [2013-07-08T23:43:41.096502]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"name": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "title": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "parsedtext": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "tag": {"type": "string", "store": "yes"}, "date": {"type": "date", "store": "yes"}, "position": {"type": "integer", "store": "yes"}, "uuid": {"index": "not_analyzed", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# [2013-07-08T23:43:41.102595]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"name": "Joe Tester", "parsedtext": "Joe Testere nice guy", "tag": "foo", "date": "2011-05-16T00:00:00", "position": 1, "uuid": "11111"}'
# [2013-07-08T23:43:41.135876]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"name": " Bill Baloney", "parsedtext": "Bill Testere nice guy", "tag": "foo", "date": "2011-04-16T00:00:00", "position": 2, "uuid": "22222"}'
# [2013-07-08T23:43:41.153587]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/3?pretty=true' -d '{"name": "Bill Clinton", "parsedtext": "Bill is not nice guy", "tag": "bar", "date": "2011-04-28T00:00:00", "position": 3, "uuid": "33333"}'
# [2013-07-08T23:43:41.157681]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# [2013-07-08T23:43:41.180693]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# [2013-07-08T23:43:41.383764]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"term": {"tag": "foo"}}, "query": {"match_all": {}}}}, "facets": {"tag": {"terms": {"field": "tag", "size": 10}}}}'
# [2013-07-08T23:43:41.388287]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# [2013-07-08T23:43:41.389145]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
