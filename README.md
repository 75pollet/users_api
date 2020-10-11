# UsersApi
## Overview

The Users Api Server operates by randomly assigning points to present users every minute.
http://localhost:4000/  displays at most two users with the highest number of points currently.

### To get started:

  * Install dependencies with `mix deps.get`.

  * Create and migrate your database with `mix ecto.setup`

  This will perform the basic database setup and add 100 users to the database each with 0 points.

  * Start Phoenix endpoint with `mix phx.server`
  The Server will start at http://localhost:4000/.
