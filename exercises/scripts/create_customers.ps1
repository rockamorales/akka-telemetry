param($n, $port)
Write-Output "---"
Write-Output "$port -- $n"

# IFS=$'\n\t'

# NUM_CUSTOMERS=$1
# PORT=$2

For ($i=0; $i -lt $n; $i++) {
    $customer_name=[guid]::NewGuid().ToString()
   # $customer_json="{'username': '${customer_name}', 'fullname': 'FULL NAME FOR ${customer_name}', 'email': '${customer_name}@example.com', 'phone': '613-555-1212', 'address': '${i} Fake St.' }"
    $customer = @{
        username = "$customer_name";
        fullname = "FULL NAME FOR ${customer_name}";
        email = "${customer_name}@example.com";
        phone = "613-555-1212";
        address = "${i} Fake St."
    }

    $endpoint = "http://localhost:$port/customers"
    Write-Output "---"
    Write-Output $customer|ConvertTo-Json
    Invoke-WebRequest -Uri $endpoint -Method POST -Body ($customer|ConvertTo-Json) -ContentType "application/json"
    # curl -H "Content-type: application/json" -X POST -d $CUSTOMER_JSON http://localhost:$PORT/customers
    # echo "---"
}