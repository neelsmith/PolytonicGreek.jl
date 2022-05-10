# Testing and composing strings


## Composing strings

Several functions simplify composing a string.  

**Example**: compose a perfect active verb form from a stem and ending:

```@example str
using PolytonicGreek
ortho = literaryGreek()
s = strcat("γραφ", "ται", ortho)
```
```@example str
reduped = reduplicate(s, ortho)
```

```@example str
accentword(reduped, :RECESSIVE, ortho)
```


**Example**: composte a pluperfect active verb form from a stem and ending:

```@example str
s = strcat("γραφ","ει", ortho)
```
```@example str
reduped = reduplicate(s, ortho)
```
```@example str
augment(reduped, ortho)
```

## Testing strings

vocalic, consonantal, accented

