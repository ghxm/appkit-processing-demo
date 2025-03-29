GET DATA /TYPE=TXT
/FILE='./momentary assessment.csv'
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
screening A1000
description A1000
delay F1
duration F1
groupsize F2
partner_gender F1
partner_close F2
interaction_quality F2
interaction_intimacy F2
interaction_control F2
interaction_intensity F2
emo_happy F2
emo_sad F2
emo_nervous F2
emo_surprise F2
emo_angry F2
emo_embarrassed F2
emo_ashamed F2
dataquality F1.
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

VARIABLE LABELS screening 'Welcome (back) for reporting on a recent social interaction!Have you been part of any social interaction in the last two hours?With social interactions we refer to those situations, in which individuals or groups react to each other, interact with one another, influence each other, and guide each other''s behavior in a reciprocal way. Under this definition, listening to a lecture would not be a social interaction, but asking a question in a lecture could be one. Furthermore, we are only interested in those interactions that lasted at least a few minutes (e.g., a simple “hello” would not classify as a social interaction). Still, we don’t prescribe a concrete minimum duration of the interaction situation, as sometimes even very short interactions can elicit strong emotional experiences.&nbsp;'.

VARIABLE LABELS description 'Please use the interaction you have just thought of as a reference for answering the following questions.&nbsp;Can you briefly describe the type of social interaction? This can make answering the following questions much easier.'.

VARIABLE LABELS delay 'How many minutes ago did this interaction take place?'.
ADD VALUE LABELS delay
('1' 'Less than 30 minutes ago'
'2' 'More than 30 but less than 60 minutes ago'
'3' 'More than 60 but less than 90 minutes ago'
'4' 'More than 90 minutes ago').

VARIABLE LABELS duration 'How long did the interaction last?For longer interactions (e.g. when you spend a whole day with friends), you can focus on the part that evoked the strongest emotional response.'.
ADD VALUE LABELS duration
('1' 'Less than 5 minutes'
'2' 'More than 5 but less than 15 minutes'
'3' 'More than 15 but less than 30 minutes'
'4' 'More than 30 but less than 60 minutes'
'5' 'More than 60 minutes ').

VARIABLE LABELS groupsize 'How many people took part in the interaction (you included)?'.

VARIABLE LABELS partner_gender 'What gender do you ascribe to your (main) interaction partner?'.
ADD VALUE LABELS partner_gender
('1' 'Female'
'2' 'Male'
'3' 'Non-binary'
'4' 'Other').

VARIABLE LABELS partner_close 'Please indicate how close you consider the relationship between you and your (main) interaction partner to be.'.

VARIABLE LABELS interaction_quality 'Please indicate your perceived quality of the interaction.'.

VARIABLE LABELS interaction_intimacy 'Please indicate the intimacy of the interaction.'.

VARIABLE LABELS interaction_control 'Please indicate your perceived degree of control over the interaction in comparison to your main interaction partner.'.

VARIABLE LABELS interaction_intensity 'Please indicate the overall intensity of your emotional experience during the interaction.'.

VARIABLE LABELS emo_happy 'Please indicate how happy you felt during the interaction.'.

VARIABLE LABELS emo_sad 'Please indicate how sad you felt during the interaction.'.

VARIABLE LABELS emo_nervous 'Please indicate how nervous you felt during the interaction.'.

VARIABLE LABELS emo_surprise 'Please indicate how surprised you felt during the interaction.'.

VARIABLE LABELS emo_angry 'Please indicate how angry you felt during the interaction.'.

VARIABLE LABELS emo_embarrassed 'Please indicate how embarrassed you felt during the interaction.'.

VARIABLE LABELS emo_ashamed 'Please indicate how ashamed you felt during the interaction.'.

VARIABLE LABELS dataquality 'Thank you very much for supporting our research.For ensuring data quality, please indicate whether you answered the questions within this survey conscientiously:'.
ADD VALUE LABELS dataquality
('1' 'I have answered the questions conscientiously'
'2' 'I did not answer the questions conscientiously (since I only want to get to know the GESIS AppKit)').