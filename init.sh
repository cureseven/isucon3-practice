#!/bin/bash -eu

echo 'init process'

mysql --user=isucon --password=isucon isucon -e "CREATE INDEX `memos_idx_is_private_created_at` ON memos (`is_private`,`created_at`);"
mysql --user=isucon --password=isucon isucon -e "CREATE INDEX `memos_idx_user_created_at` ON memos (`user`,`created_at`);"
mysql --user=isucon --password=isucon isucon -e "CREATE INDEX `memos_idx_user_is_private_created_at` ON memos (`user`,`is_private`,`created_at`);"