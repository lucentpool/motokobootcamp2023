import List "mo:base/List";
import Utils "utils";
import Book "book";
import Debug "mo:base/Debug";


actor DChallengeDay2 {
    type Book = Book.Book;
    stable var books : List.List<Book> = List.nil<Book>();

    //  create a function called add_book that takes a book as parameter and returns nothing this function should add this book to your list.
    public func add_book( title: Text, pages : Nat ) : async () {
        let book : Book = await Book.create_book(title, pages);
        books := List.push(book, books);
        Debug.print(debug_show(books));
    };

    // create a second function called get_books that takes no parameter but returns an Array that contains all books stored in the list.
    public query func get_books() : async [Book] {
        return List.toArray(books);
    };

};