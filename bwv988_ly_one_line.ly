\version "2.25.26"

\include "bwv-zeug.ily"

\include "bwv988-main.ly"


% One-line score for notehead extraction
\book {
  \oneLinePaper
  \score {
    {
      \tempo 4 = 180
      \bwv
    }    
    \oneLineLayout
    \midiStaffPerformerToVoiceContext
  }
}