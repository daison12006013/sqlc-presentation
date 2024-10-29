-- name: GetUserByUid :one
select * from users where id = ? limit 1;

-- name: UpdateEmailByUid :exec
update users set email = ?, updated_at = now() where uid = ?;

-- name: UpdateUserByUid :exec
update users
set
    name = coalesce(sqlc.narg('name'), name),
    email = coalesce(sqlc.narg('email'), email),
    email_verified_at = coalesce(sqlc.narg('email_verified_at'), email_verified_at),
    password = coalesce(sqlc.narg('password'), password),
    remember_token = coalesce(sqlc.narg('remember_token'), remember_token),
    updated_at = now()
where uid = ?;

-- name: DeleteUserByUid :exec
delete from users where uid = ?;

-- name: GetPaginatedUsers :many
select * from users order by created_at desc limit ? offset ?;
