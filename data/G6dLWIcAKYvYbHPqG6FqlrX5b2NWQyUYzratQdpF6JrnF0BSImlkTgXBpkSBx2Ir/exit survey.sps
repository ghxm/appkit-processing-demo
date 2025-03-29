GET DATA /TYPE=TXT
/FILE='./exit survey.csv'
/ENCODING='UTF8'
/ARRANGEMENT=DELIMITED
/FIRSTCASE=2
/DELIMITERS=';'
/QUALIFIER='"'
/DELCASE=LINE
/VARIABLES=personalParticipantCode A15
generalLoginCode A15
committed A32
scheduled A32
published A32
osVersion A15
smartphoneType A32
exit A1000
paqf1 F1
paqf2 F1
paqf3 F1
paqf4 F1
paqf5 F1
paqf6 F1
paqf7 F1
paqf8 F1
paqm1 F1
paqm2 F1
paqm3 F1
paqm4 F1
paqm5 F1
paqm6 F1
paqm7 F1
paqm8 F1.
CACHE.
EXECUTE.
DATASET NAME DATA WINDOW=FRONT.


VARIABLE LABELS personalParticipantCode 'PersonalParticipantCode'.

VARIABLE LABELS generalLoginCode 'GeneralLoginCode'.

VARIABLE LABELS committed 'Committed'.

VARIABLE LABELS scheduled 'Scheduled'.

VARIABLE LABELS published 'Published'.

VARIABLE LABELS osVersion 'OS Version'.

VARIABLE LABELS smartphoneType 'SmartphoneType'.

VARIABLE LABELS exit 'Today was the last day of the study!&nbsp;We thank you very much for participating in our study. You have significantly contributed to our efforts in learning more about the experience of social interactions and in testing new methods to obtain reliable data.&nbsp;If you have conscientiously answered all the questions about interactions you have experienced throughout the last days, we would be very happy if you are willing to provide us with just a little more information about yourself. This will take less than 3 minutes.&nbsp;Would you like to answer a few final questions?'.

VARIABLE LABELS paqf1 'I am emotional.'.
ADD VALUE LABELS paqf1
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqf2 'I am able to devote myself completely to others.'.
ADD VALUE LABELS paqf2
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqf3 'I am understanding.'.
ADD VALUE LABELS paqf3
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqf4 'I am gentle.'.
ADD VALUE LABELS paqf4
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqf5 'I am helpful to others.'.
ADD VALUE LABELS paqf5
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqf6 'I am kind.'.
ADD VALUE LABELS paqf6
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqf7 'I am unaware of the feelings of others.'.
ADD VALUE LABELS paqf7
('6' 'Never true'
'5' 'Almost never true'
'4' 'Occasionally true'
'3' 'Usually true'
'2' 'Almost always true'
'1' 'Always true').

VARIABLE LABELS paqf8 'I am warm in relation to others.'.
ADD VALUE LABELS paqf8
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqm1 'I am independent.'.
ADD VALUE LABELS paqm1
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqm2 'I am a proactive person.'.
ADD VALUE LABELS paqm2
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqm3 'I am competitive.'.
ADD VALUE LABELS paqm3
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqm4 'I have difficulties making decisions.'.
ADD VALUE LABELS paqm4
('6' 'Never true'
'5' 'Almost never true'
'4' 'Occasionally true'
'3' 'Usually true'
'2' 'Almost always true'
'1' 'Always true').

VARIABLE LABELS paqm5 'I give up easily.'.
ADD VALUE LABELS paqm5
('6' 'Never true'
'5' 'Almost never true'
'4' 'Occasionally true'
'3' 'Usually true'
'2' 'Almost always true'
'1' 'Always true').

VARIABLE LABELS paqm6 'I feel superior.'.
ADD VALUE LABELS paqm6
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqm7 'I am self-confident.'.
ADD VALUE LABELS paqm7
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').

VARIABLE LABELS paqm8 'I function well under pressure.'.
ADD VALUE LABELS paqm8
('1' 'Never true'
'2' 'Almost never true'
'3' 'Occasionally true'
'4' 'Usually true'
'5' 'Almost always true'
'6' 'Always true').