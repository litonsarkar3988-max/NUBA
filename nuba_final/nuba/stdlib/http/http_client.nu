# stdlib/http: HTTP Client utilities (simulation)
fun http_get(url) {
    print("GET", url)
    return {"status": 200, "body": "Response from " + url, "headers": {"content-type": "text/plain"}}
}
fun http_post(url, data) {
    print("POST", url, "with", data)
    return {"status": 201, "body": "Created", "headers": {}}
}
fun http_put(url, data) {
    print("PUT", url, "with", data)
    return {"status": 200, "body": "Updated", "headers": {}}
}
fun http_delete(url) {
    print("DELETE", url)
    return {"status": 204, "body": "", "headers": {}}
}
fun is_ok(response) { return response["status"] >= 200 and response["status"] < 300 }
fun status_text(code) {
    match code {
        case 200 -> { return "OK" }
        case 201 -> { return "Created" }
        case 204 -> { return "No Content" }
        case 400 -> { return "Bad Request" }
        case 401 -> { return "Unauthorized" }
        case 404 -> { return "Not Found" }
        case 500 -> { return "Internal Server Error" }
        case _   -> { return "Unknown" }
    }
}
