import os
import logging

from http.server import BaseHTTPRequestHandler, HTTPServer

logging.basicConfig(level=logging.INFO)

class BasicHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/ping':
            logging.info('Python Web Server /ping')
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(bytes('OK', "utf-8"))
        else:
            logging.info('Python Web Server /')
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(bytes('<html lang="en"><head><title>Python Server</title></head><body><p>Python Web Server</p></body></html>', "utf-8"))
        return


if __name__ == "__main__":        
    try:
        logging.info('Python Web Server starting')
        server_host = os.environ.get('HOST', '')
        server_port = os.environ.get('PORT', '3001')
        server_addr = (server_host, int(server_port))

        logging.info('Setting server on {0}:{1}'.format(server_host, server_port))
        server = HTTPServer(server_addr, BasicHandler)

        logging.info('Server serving on {0}:{1}'.format(server_host, server_port))
        server.serve_forever()
    except KeyboardInterrupt:
        logging.info('Python Web Server stopping')
        server.server_close()
    finally:
        logging.info('Python Web Server stopped')
