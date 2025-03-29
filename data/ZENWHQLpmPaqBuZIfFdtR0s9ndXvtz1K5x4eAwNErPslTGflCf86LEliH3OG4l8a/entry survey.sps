GET DATA /TYPE=TXT
/FILE='./entry survey.csv'
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
aim01 F1
aim02 F1
aim03 F1
aim04 F1
aim05 F1
aim06 F1
aim07 F1
aim08 F1
aim09 F1
aim10 F1
aim11 F1
aim12 F1
aim13 F1
aim14 F1
aim15 F1
aim16 F1
aim17 F1
aim18 F1
aim19 F1
aim20 F1
age F2
sex F1
gender F1.
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

VARIABLE LABELS aim01 'When I feel happiness, it is a quite type of contentment.'.
ADD VALUE LABELS aim01
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim02 'When a person in a wheelchair can’t get through a door, I have strong feelings of pity.'.
ADD VALUE LABELS aim02
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim03 'I get upset easily.'.
ADD VALUE LABELS aim03
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim04 'When I succeed at something, my reaction is calm contentment.'.
ADD VALUE LABELS aim04
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim05 'I get really happy or really unhappy.'.
ADD VALUE LABELS aim05
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim06 'I am a fairly quiet person.'.
ADD VALUE LABELS aim06
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim07 'When I’m happy, I feel fairly energetic.'.
ADD VALUE LABELS aim07
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim08 'Seeing a picture of some violent car accident in a newspaper makes me feel sick to my stomach.'.
ADD VALUE LABELS aim08
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim09 'When I’m happy, I feel like I’m bursting with joy.'.
ADD VALUE LABELS aim09
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim10 'I would be very upset, if I got a traffic ticket.'.
ADD VALUE LABELS aim10
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim11 'Looking at beautiful scenery really doesn’t affect me much.'.
ADD VALUE LABELS aim11
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim12 'The weather doesn’t affect my mood.'.
ADD VALUE LABELS aim12
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim13 'Others tend to get more excited than I do.'.
ADD VALUE LABELS aim13
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim14 'I am not an extremely enthusiastic individual.'.
ADD VALUE LABELS aim14
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim15 'Calm and cool’ could easily describe me.'.
ADD VALUE LABELS aim15
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim16 'When I’m feeling well it is easy for me to go from being in a good mood to being really joyful.'.
ADD VALUE LABELS aim16
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim17 'When I worry, it is so mild I hardly notice it.'.
ADD VALUE LABELS aim17
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim18 'I get overly enthusiastic.'.
ADD VALUE LABELS aim18
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim19 'My happy moods are so strong that I feel like I’m ‘in heaven’.'.
ADD VALUE LABELS aim19
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS aim20 'When something bad happens, others tend to be more unhappy than I.'.
ADD VALUE LABELS aim20
('1' 'Never'
'2' 'Almost never'
'3' 'Occasionally'
'4' 'Usually'
'5' 'Almost always'
'6' 'Always').

VARIABLE LABELS age 'How old are you (in years)?'.

VARIABLE LABELS sex 'Which sex was assigned to you at birth?'.
ADD VALUE LABELS sex
('1' 'Female'
'2' 'Male'
'3' 'Intersex').

VARIABLE LABELS gender 'What is your gender?'.
ADD VALUE LABELS gender
('1' 'Female'
'2' 'Male'
'3' 'Another gender (e.g. non-binary)').