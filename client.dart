#import('synth.dart');

main() {

  route(GET, '/', (req, res)
      => res.write('Hello, synthesizers!'));

  route(GET, '/hey', (req, res)
      => res.write('yo'));

  route(GET, '/person/:name', (req, res) {
    var name = req.path.split('/')[2];
    res.write('Hello, $name');
  });

  route(GET, '/login', (req, res) {
    res.write(
        '''
        <!DOCTYPE html>
        <html>
        <body>
        <form action="/login" method="POST">
        <input type="text" name="username" placeholder="Username" /><br />
        <input type="password" name="password" placeholder="Password" /><br />
        <input type="submit" value="Login" />
        </form>
        </body>
        </html>
        '''
        );
  });

  route(POST, '/login', (req, res) {
    req.inputStream.pipe(res.outputStream);
  });

  route(GET, '/hello', (req, res)
      => res.write('Hello, World!'));

  start(7000);
  print('Synthesizing on port 7000...');

}