extern crate servinator;

use servinator::{runner, structs};

#[macro_use]
extern crate qmlrs;

struct Cli;
impl Cli {
    fn execute(&self, service_type_id: i64, customer_id: i64, num_operators: i64, dir: String, token: String) -> String {
        let config = structs::Config{
            url: String::from(""),
            token: token,
            service_type_id: service_type_id as i32,
            customer_id: customer_id as i32,
            operators: num_operators as i32
        };

        let data = structs::Data{
            dir: dir,
            config: None
        };

        println!("Algo paso por aquí");

        match runner::run_with_config(&data, &config) {
            Ok(_) => String::from("Ok"),
            Err(_) => String::from("Falló")
        }
    }
}

Q_OBJECT! { Cli:
    slot fn execute(i64, i64, i64, String, String);
}

fn main() {
    let mut engine = qmlrs::Engine::new();
    engine.set_property("Cli", Cli);
    
    engine.load_local_file("src/qml/main.qml");
    engine.exec();
}

