CREATE KEYSPACE IF NOT EXISTS  uasis_keyspace WITH REPLICATION = {
    'class': 'SimpleStrategy', 'replication_factor':'2'
};