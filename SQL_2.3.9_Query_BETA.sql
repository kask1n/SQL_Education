РUPDATE supply
    LEFT JOIN book
    USING (title)
    LEFT JOIN author
    ON supply.author = author.name_author
    LEFT JOIN genre
    USING (genre_id)
SET title = IF(book.title IS NOT NULL,
               CONCAT(title, ' (', name_genre, ')'),
               IF(author.name_author IS NOT NULL,
                  CONCAT(title, ' (возможно ', (

                      # TODO: Указать жанр наиболее новой книги искомого автора.
                      SELECT name_genre
                      FROM genre
                               INNER JOIN book
                                          USING (genre_id)
                               INNER JOIN author
                                          USING (author_id)
                      ORDER BY book_id DESC
                      LIMIT 1), ')'),

                  CONCAT(title, ' (не указан)')));

SELECT *
FROM supply;

SELECT supply.*,
       book.*,
       author.*,
       genre.*,
       IF(book.title IS NOT NULL,
          CONCAT(title, ' (', name_genre, ')'),
          IF(author.name_author IS NOT NULL,
             CONCAT(title, ' (возможно ', (

                 # TODO: Указать жанр наиболее новой книги искомого автора.
                 SELECT name_genre
                 FROM genre
                          INNER JOIN book
                                     USING (genre_id)
                          INNER JOIN author
                                     USING (author_id)
                 ORDER BY book_id DESC
                 LIMIT 1), ')'),

             CONCAT(title, ' (не указан)'))) AS new_title
FROM supply
         LEFT JOIN book
                   USING (title)
         LEFT JOIN author
                   ON supply.author = author.name_author
         LEFT JOIN genre
                   USING (genre_id);
