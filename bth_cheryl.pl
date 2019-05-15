
%% May		 15 16			19
%% June				17	18
%% July	  14	16
%% August 14 15		17
%% Cheryl then tells Albert and Bernard separately the month and the day of her birthday respectively.
%% Albert: I don't know when Cheryl's birthday is, but I know that Bernard doesn't know too. (s1)
%% Bernard: At first I don't [sic] know when Cheryl's birthday is, but I know now. (s2)
%% Albert: Then I also know when Cheryl's birthday is. (s3)
%% So when is Cheryl's birthday?

possible_birthday('May', 15).
possible_birthday('May', 16).
possible_birthday('May', 19).
possible_birthday('June', 17).
possible_birthday('June', 18).
possible_birthday('July', 14).
possible_birthday('July', 16).
possible_birthday('August', 14).
possible_birthday('August', 15).
possible_birthday('August', 17).

unique_day_in_month(M) :- possible_birthday(M, D), findall(Month, possible_birthday(Month, D), [_]).

statement1(M, D) :-  possible_birthday(M, D), findall(X, possible_birthday(M, X), [ _ , _ | _ ]), 
not(unique_day_in_month(M)).

statement2(M, D) :- possible_birthday(M, D), findall(X, statement1(X, D), [M]).

statement3(M, D) :- possible_birthday(M, D), findall(X, statement2(M, X), [D]).

birthday(M, D) :- statement3(M, D).