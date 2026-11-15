fn main() {
    println!("Come on");
}

/*

use axum::Router;
use std::net::SocketAddr;
use tower_http::services::ServeDir;

const PORT: u16 = 6767;

#[tokio::main(flavor = "current_thread")]
async fn main() {
    serve(using_serve_dir(), PORT).await
}

fn using_serve_dir() -> Router {
    Router::new().nest_service("/assets", ServeDir::new("."))
}

async fn serve(app: Router, port: u16) {
    let addr = SocketAddr::from(([127, 0, 0, 1], port));
    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    webbrowser::open(&format!("http://127.0.0.1:{port}/assets/")).unwrap();
    axum::serve(listener, app).await.unwrap();
}

*/
