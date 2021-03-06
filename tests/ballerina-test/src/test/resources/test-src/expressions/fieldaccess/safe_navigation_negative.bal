struct Person {
    int a;
    string fname = "John";
    string lname;
    Info|error info1;
    Info|() info2;
}

struct Info {
    Address|error address1;
    Address|() address2;
}

struct Address {
    string street;
    string city;
    string country = "Sri Lanka";
}

function testErrorLiftingAcessWithoutErrorOnLHS () returns any {
    Address adrs = {city:"Colombo"};
    Info inf = {address1 : adrs};
    Person prsn = {info1 : inf};
    Person|error p = prsn;
    string|() x = p!info1!address1!city;
    return x;
}

function testFieldAcessWithoutErrorLifting () returns any {
    error e = {message:"custom error"};
    Info inf = {address1 : e};
    Person prsn = {info1 : inf};
    Person|error p = prsn;
    string|error|() x = p!info1.address1!city;
    return x;
}
