walker check_driving_age {
    has age:int;
    has country:str;

    start {
        let country_lower = country.lower();
        let legal_age = 0;

        if country_lower == "kenya" {
            legal_age = 18;
        } else if country_lower == "us" {
            legal_age = 16;
        } else {
            yield "Country not supported.";
            stop;
        }

        if age >= legal_age {
            yield "You are eligible to drive in " + country_lower.capitalize() + ".";
        } else {
            yield "You are NOT eligible to drive in " + country_lower.capitalize() + " yet.";
        }
    }
}

with entry {
    root spawn check_driving_age(age=20, country="Kenya") |> stdout;
    root spawn check_driving_age(age=15, country="US")   |> stdout;
    root spawn check_driving_age(age=21, country="Canada") |> stdout;
}