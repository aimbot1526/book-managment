# book-managment

## Add database to your localhost
- First create database and then restore it with this file.

![](https://github.com/aimbot1526/book-managment/blob/master/src/main/resources/ezgif.com-gif-maker.gif)

## To Start Server
Go in project's root directory and run these commands.
```bash
./gradlew clean
```
```bash
./gradlew bootRun
```

## REST API 

- **`GET /api/auth/signup`** create user
   ```
    { "username": "username here", "email": "email here", "password": "password here"}
    ```
- **`POST /api/auth/signin`** Login with user credentials
   ```
    { "username": "username here", "password": "password here"}
    ```
- **`GET /api/auth/users/{userId}/stores`** List of all stores for the user
- **`GET /api/auth/stores/{storeId}/inventory`** List out all the books in inventory inside the store
- **`DELETE /api/auth/books/{bookId}`** Remove from the inventory.

- **`POST /api/auth/books`** Add a new book.
- **`POST /api/auth/inventory/{bookId}/{storeId}`** Update inventory for an existing book.
    ```
    { "bookCount" : "book count here in numerals" }
    ```
