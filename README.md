
    bundle exec rackup

    curl -X POST -d '{}' -H 'Accept: application/json' -H 'Content-Type: application/json' http://localhost:9292/entity_less

    curl -X POST -d '{}' -H 'Content-Type: application/json' http://localhost:9292/accept_mismatch

    curl -X GET -H 'Accept: application/json' http://localhost:9292/accept_mismatch

