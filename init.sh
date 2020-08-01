#!/bin/bash -eu

echo 'init process'

mysql --user=isucon --password=isucon isucon -e "CREATE INDEX memos_idx_is_private_created_at ON memos (is_private, created_at);"
mysql --user=isucon --password=isucon isucon -e "CREATE INDEX memos_idx_user_created_at ON memos (user,created_at);"
mysql --user=isucon --password=isucon isucon -e "CREATE INDEX memos_idx_user_is_private_created_at ON memos (user,is_private,created_at);"
mysql --user=isucon --password=isucon isucon -e "CREATE TABLE isucon.public_memos (id int(11) auto_increment,memo_id int(11),PRIMARY KEY (id));"
mysql --user=isucon --password=isucon isucon -e "INSERT INTO public_memos (memo_id) SELECT id FROM memos WHERE is_private=0 ORDER BY created_at DESC;"
mysql --user=isucon --password=isucon isucon -e "CREATE TABLE isucon.public_count (`cnt` int(11) DEFAULT NULL),PRIMARY KEY (id));"

mysql --user=isucon --password=isucon isucon -e "UPDATE public_count SET cnt = 20540;"
mysql --user=isucon --password=isucon isucon -e "DELETE FROM public_memos WHERE id > 20540;"
mysql --user=isucon --password=isucon isucon -e "ALTER TABLE public_memos AUTO_INCREMENT = 20541;"