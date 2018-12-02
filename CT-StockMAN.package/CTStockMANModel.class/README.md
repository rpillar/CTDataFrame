Base class for StockMAN Model classes.

The 'relation' methods require access to the database using the 'resource' class. As a consequence all the model classes need to inherit from WAComponent to enable access to the session class.