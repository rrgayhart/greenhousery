GreenHousery
-----------
Green Project Planning


## Setup

1. Install gems with: `bundle`
2. Presuming you have Postgres installed (if not: `brew install postgres`):
  * create database with: `rake db:setup` or `rake db:create`
3. Run the database migrations with `rake db:migrate db:test:prepare`.
11. Start the server with `rails s`
12. Login at http://localhost:3000.

## Testing

1. Prepare the test environment with `RACK_ENV=test rake db:migrate`.
2. Make sure that `postgres` is running.
3. Run the test suite with `rspec`.

## Production Link

http://greenhousery.herokuapp.com/

## License

MIT License

Copyright (C) 2014 Romeeka Gayhart
 
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
