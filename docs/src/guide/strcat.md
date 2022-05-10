# Testing and composing strings


## Composing strings

Several functions simplify composing a string.  

**Example**: composte a perfect active verb form from a stem and ending:

```@example str
using PolytonicGreek
ortho = literaryGreek()
s = strcat("γραφ", "ται", ortho)
```
```@example str
augmented = augment(s, ortho)
```

```@example str
accentword(augmented, :RECESSIVE, ortho)
```


**Example**: composte a pluperfect active verb form from a stem and ending:

```@example str
s = strcat("γραφ","ει", ortho)
```
```@example str
reduplicate(s, ortho)
```
```@example str
augment(s, ortho)
```

## Testing strings

vocalic, consonantal, accented

