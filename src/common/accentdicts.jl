"""Dictionary of barytone to oxytone conversions.

$(SIGNATURES)

Default to using `LiteraryGreekOrthography`.
"""
function flipdict()
    flipdict(literaryGreek())
end


"""List all code points including an accent.

$(SIGNATURES)

Default to using `LiteraryGreekOrthography`.
"""
function allaccents()
    allaccents(literaryGreek())
end


"""Dictionary mapping Unicode codepoints with accents to
codepoint with accent stripped.

$(SIGNATURES)

Default to using `LiteraryGreekOrthography`.
"""
function accentstripdict()
    accentstripdict(literaryGreek())
end


"""Dictionary of circumflexes.

$(SIGNATURES)

Default to using `LiteraryGreekOrthography`.
"""
function circumflexdict()
    circumflexdict(literaryGreek())
end

"""Dictionary of acutes.

$(SIGNATURES)

Default to using `LiteraryGreekOrthography`.
"""
function acutedict()
    acutedict(LiteraryGreekOrthography)
end