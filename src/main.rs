use axum::Router;
use camino::{Utf8Path, Utf8PathBuf};
use clap::Parser;
use std::net::SocketAddr;
use tower_http::services::ServeDir;

const PORT: u16 = 6767;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    root_dir: Option<Utf8PathBuf>,

    #[arg(long, default_value_t = PORT)]
    port: u16,
}

#[tokio::main(flavor = "current_thread")]
async fn main() {
    let args = Args::parse();
    let root_dir = args.root_dir.as_deref().unwrap_or(Utf8Path::new("."));
    serve(using_serve_dir(root_dir), args.port).await
}

fn using_serve_dir(root_dir: &Utf8Path) -> Router {
    Router::new().nest_service("/files", ServeDir::new(root_dir))
}

async fn serve(app: Router, port: u16) {
    let addr = SocketAddr::from(([127, 0, 0, 1], port));
    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    webbrowser::open(&format!("http://127.0.0.1:{port}/files/")).unwrap();
    axum::serve(listener, app).await.unwrap();
}
