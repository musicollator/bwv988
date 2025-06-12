\version "2.25.26"

\include "bwv-zeug.ily"

\include "bwv988-main.ly"

% Formatted one-pager for display
\book {
  \bookOutputName "test"
  \onePagePaper 
  \score {
    \bwv
    \onePageLayout
  }
}
