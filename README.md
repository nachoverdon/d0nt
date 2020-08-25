### Usage

To prevent yourself from committing unwanted code, write `@d0nt` somewhere in the code.
Ex:

```java
public ThingThatDealsWithMoney {
  public ThingThatDealsWithMoney() {
    // @d0nt
    String user = "nachoverdon";
    String password = "s3cUr€pA5sW0rD";
    boolean secure = true;

    login(user, password, true);
  }
}
```

Call the program from your repository's `.git/hooks/pre-commit` file.

```sh
#!/bin/bash

C:/projects/tools/d0nt/d0nt.exe
exit $?
```

If `@d0nt` is found, the commit will fail.

### Build

```
v -prod -autofree d0nt.v
```
