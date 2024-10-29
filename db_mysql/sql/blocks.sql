-- name: HasBlockRecord :one
select exists (
    select 1 from blocks where
        (profile_id = sqlc.arg('profile_id1') and member_id = sqlc.arg('member_id1')) or
        (member_id = sqlc.arg('member_id2') and profile_id = sqlc.arg('profile_id2'))
limit 1);
