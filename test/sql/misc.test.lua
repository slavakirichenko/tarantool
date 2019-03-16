test_run = require('test_run').new()
engine = test_run:get_cfg('engine')
box.execute('pragma sql_default_engine=\''..engine..'\'')

-- Forbid multistatement queries.
box.execute('select 1;')
box.execute('select 1; select 2;')
box.execute('create table t1 (id INT primary key); select 100;')
box.space.t1 == nil
box.execute(';')
box.execute('')
box.execute('     ;')
box.execute('\n\n\n\t\t\t   ')
