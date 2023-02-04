use std::{
    io::{prelude::*, BufReader},
    net::{TcpListener, TcpStream},
};

// Reference - https://doc.rust-lang.org/book/ch20-01-single-threaded.html

fn main() {
    let listener = TcpListener::bind("0.0.0.0:3002").unwrap();
    println!("Listening for connections on port {}", 3002);

    for stream in listener.incoming() {
        let stream = stream.unwrap();

        println!("Connection established!");
        handle_connection(stream);
    }
}

fn handle_connection(mut stream: TcpStream) {
    const HTML_STRING : &str ="<html lang=\"en\"><head><title>Rust Server</title></head><body><p>Rust Web Server</p></body></html>";
    let buf_reader = BufReader::new(&mut stream);
    let http_request: Vec<_> = buf_reader
        .lines()
        .map(|result| result.unwrap())
        .take_while(|line| !line.is_empty())
        .collect();

    println!("{:?}", http_request);

    let status_line = "HTTP/1.1 200 OK";
    let length = HTML_STRING.len();

    let response = format!("{status_line}\r\nContent-Length: {length}\r\n\r\n{HTML_STRING}");

    stream.write_all(response.as_bytes()).unwrap();
}
