\version "2.25.26"

%-----------------------definitions
adjTieDown = \shape #'((0 . -0.2) (0 . -0.3) (0 . -0.3) (0 . -0.2)) Tie
adjTieUp = \shape #'((0 . 0.2) (0 . 0.3) (0 . 0.3) (0 . 0.2)) Tie
adjTieOne = \shape #'(
                       ((0 . -1.0) (0 . -1.2) (0 . -1.2) (0 . -1.0))
                       ((0 . -1.0) (0 . -1.2) (0 . -1.2) (0 . -1.0))
                       ) Tie
adjTieTwo = \shape #'((0 . -0.2) (0 . -0.3) (0 . -0.3) (0 . -0.2)) Tie

soprano = {
  \key g \major
  \time 2/2

  %% \repeat volta 2
  {
    r2 g''2 ~
    g''2 fis'' ~
    fis''4 g''8 fis'' \adjTieUp e''2 ~
    e''4 d''8 cis'' d''2
    r2 \adjTieUp e''2 ~
    e''4 d''8 e'' fis''2 ~
    fis''4 a''8 g'' a''2 ~
    a''8 g'' a'' fis'' g''2
    r2 \adjTieUp e''2 ~
    e''2 \adjTieUp d'' ~ \noBreak
    d''4 e''8 fis'' g''2 ~
    g''8 fis'' g'' e'' fis''2 ~
    fis''4 fis'' \adjTieUp e''2 ~
    e''4 e'' \adjTieUp d''2 ~
    d''4 g'' cis''8 d'' e''4 ~
    e''2 d'' \break
  }
  %% \repeat volta 2
  {
    r2 a''2 ~
    a''2 g'' ~
    g''4 a''8 b'' c'''2 ~
    c'''8 b'' c'''4 b''2
    d''2 \rest e''2 ~ \noBreak
    e''2 dis''4 e'' \break
    fis''2. e''8 fis''
    g''2 ~ g''8 fis'' e'' d''
    c''4 r a''2 ~
    a''2 \adjTieUp g'' ~
    g''4 a''8 b'' \adjTieUp c'''2 ~
    c'''8 b'' c''' a'' b''2 ~
    b''4 b'' a''2 ~
    a''4 a'' g''2 ~
    g''4 c''' fis''8 g'' a''4 ~
    a''2 g''
  }
}

alto = {
  \key g \major
  \time 2/2

  %% \repeat volta 2
  {
    b'1
    a'2. b'8 a'
    g'2. fis'8 e'
    fis'2 r2
    g'2. fis'8 g'
    a'2. c''8 b'
    c''2 ~ c''8 b' c'' a'
    b'2 r2
    g'1
    fis'2. g'8 a'
    b'2 ~ b'8 a' b' g'
    a'2. a'4
    g'2. g'4
    fis'2. b'4
    e'8 fis' g'2.
    fis'1
  }
  %% \repeat volta 2
  {
    c''1
    b'2. c''8 d''
    e''2 ~ e''8 dis'' e''4
    dis''2 b' \rest
    g'1
    fis'4 g' \adjTieOne a'2 ~
    a'4 g'8 a' \adjTieTwo b'2 ~
    b'8 a' g' fis' e'4 r
    c''1
    b'2. c''8 d''
    \adjTieDown e''2 ~ e''8 d'' e'' c''
    d''2. d''4
    c''2. c''4
    b'2. e''4
    a'8 b' c''2.
    b'1
  }
}

bass = {
  \clef bass
  \key g \major
  \time 2/2

  %% \repeat volta 2
  {
    r4 g8 a b4 c'
    d'4 d d'2
    r4 e'8 d' cis'4 a
    d'4 d d' c'?
    b4-\prallprall a8 b c'4 c
    c'4 b8 c' d'4 a
    d4 fis8 e fis4 d
    g4 d g, g8 a
    b4 a8 b cis'4 b8 cis'
    d'4 cis' b a
    g fis e d
    cis4 b,8 cis d4 cis8 d
    b,4 a,8 b, cis4 b,8 cis
    ais,4 gis,8 ais, b, a, g, fis,
    g,4 e, a, a,,
    d, a, d2
  }
  %% \repeat volta 2
  {
    r4 d8 e fis4 d
    g4 g, g a8 b
    c'4 b a g8 a
    b4. a8 g fis e dis
    e4 e'8 d' c'4 b
    a4 b8 c' fis4 g8 a
    dis4 e8 fis b,4 cis8 dis
    e4 \clef treble e'8 dis' e'4 fis'8 g'
    a'4 g'8 a' fis'4 e'8 fis'
    g'4 fis' e' d'
    c'4 b \clef bass a g
    fis4 e8 fis g4 fis8 g
    e4 d8 e fis4 e8 fis
    dis4 cis8_[ dis] e_[ d c b,]
    c4 a, d d,
    g, d g2
  }
}

%%
%% Layout
%%

bwv = \context PianoStaff <<
  \context Staff = "upper" { 
    \clef treble 
    <<
      \new Voice \with {
        midiInstrument = "violin"
      } {
        \voiceOne
        \soprano
      }
      \\
      \new Voice \with {
        midiInstrument = "viola"
      } {
        \voiceTwo
        \alto
      }
    >>
  }
  \context Staff = "lower" {
    \new Voice \with {
      midiInstrument = "cello"
    } {
      \bass
    }
  }
>>