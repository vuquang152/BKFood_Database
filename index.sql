-- explain select * from menu where price > 0;

-- create index idx on menu using btree(price);
-- explain select * from menu where price > 0;
-- drop index idx

-- create index idx on menu using hash(price);
-- explain select * from menu where price > 0;
-- drop index idx

-- explain select * from menu where price > 20000;

-- create index idx on menu using btree(price);
-- explain select * from menu where price > 20000;
-- drop index idx

-- create index idx on menu using hash(price);
-- explain select * from menu where price > 20000;
-- drop index idx

-- explain select * from menu where price > 50000;

-- create index idx on menu using btree(price);
-- explain select * from menu where price > 50000;
-- drop index idx

-- create index idx on menu using hash(price);
-- explain select * from menu where price > 50000;
-- drop index idx

-- explain select * from menu where item_name like 'Cơm%';

-- create index idx on menu using btree(price);
-- explain select * from menu where item_name like 'Cơm%';
-- drop index idx

create index idx on menu using hash(price);
explain select * from menu where item_name like 'Cơm%';
