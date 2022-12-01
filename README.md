# Fuzzy-Logic-Interpreter

# Rights Declearation
All rights reserved to Jacob Jian Li
New York University (NYU)
Department of Business (DPB)
Management and System Program (MASY)
Master of Science in Management of Science



# What is Fuzzy Logic

Fuzzy logic is a method to variable processing that allows for numerous possible truth values to be processed through the same variable. Fuzzy logic aims to answer problems by employing an open, imperfect spectrum of data and heuristics, which allows for a variety of accurate conclusions. Fuzzy logic is supposed to solve problems by examining all available information and making the best feasible choice given the input.

Fuzzy logic is an extension of conventional logic, in which every assertion has a truth value of either one or zero. In fuzzy logic, assertions can have partial truth values, such as 0.90 or 0.50. In addition to binary true or false, fuzzy logic enables us to build algorithm with human interpreterable rules.

Using fuzzy logic has serveral advantages: more likely to reflect real-world issues, demanding less hardware than traditional boolean logic, and providing correct outcomes with vague terms.
Nevertheiess, using Fuzzy Logic requires extensive validation and verification of fuzzy algorithms and fuzzy control methods rely on human knowledge and expertise.

# Fuzzy Inference System (FIS)

The Fuzzy Inference System, often known as the FIS,is an essential part of every fuzzy controller. The FIS is made up of a variety of functional blocks. The application of if-then rules to fuzzy input and the generation of output that corresponds to those rules are the primary responsibilities of any FIS. 
The entire method is founded on the computer paradigm, which incorporates concepts such as fuzzy set theory, if-then rules, and the fuzzy reasoning process. The actual process of mapping from a given input to an output while making use of fuzzy logic is referred to as fuzzy inference (reasoning). FIS have been successfully implemented in a wide variety of domains, including autonomous control, data classification, decision analysis, and expert systems.
            
Because to the fact that it may be used to a variety of fields, the fuzzy inference system is also commonly referred to as Fuzzy-Rule-Based System, Fuzzy Expert System, Fuzzy Model, Fuzzy Associative Memory, Fuzzy Logic Controller, or Fuzzy System.


# Membership Functions
A fuzzy set's membership function is a generalization of the indicator function for classical sets. This concept can be found in the field of mathematics. It is an extension of valuation that serves as a representation of the degree of truth in fuzzy logic. Although they are conceptually distinct,degrees of truth and probabilities are frequently confused with one another. This is due to the fact that fuzzy truth represents membership in loosely defined sets rather than the likelihood of some event or condition. Aliasker Zadeh is credited with being the first person to present membership functions in the first paper on fuzzy sets (1965). In his theory of fuzzy sets, Aliasker Zadeh proposed using a membership function (with a range covering the interval (0,1)) operating on the domain of all possible values. This function would have a range that would cover the interval."),

For any set X,a membership function on X is any function from X to the real unit interval [0,1].Membership functions represent fuzzy subsets of X.")

# Fuzzification

In the perspective of fuzzy logic, there is no clear distinction between small, moderate, and large; that is,the size of a certain type does not belong to a particular class, but is instead measured by its membership. Fuzzification is the process of transforming the input value of logic into the membership of each set and it is also the initial stage in fuzzy logic.

Use the membership function to determine the link between the input value and the membership degree. The graph of the membership function is flexible,but the triangle or trapezoid is the most popular method. There are currently no mature and successful procedures for the establishment of membership function, and the majority of systematic methods continue to be based on experience and experimentation. Distinct persons will develop different membership functions for the same nebulous concept, even when the forms are not identical. 
              
As long as the same fuzzy notion can be reflected, solving and processing actual fuzzy information will still result in the same outcome. Here are some typical procedures: (1) Fuzzy statistical method, (2) Examples, (3) Method based on expert experience, and (4) binary contrast sorting method."

# Defuzzification

Given fuzzy sets and the membership degrees associated with those sets,the process of defuzzification is the act of obtaining a quantifiable outcome in crisp logic. The process that converts a fuzzy set into a crisp set is referred to as mapping. In most cases, fuzzy control systems demand that it be present. These systems will include a number of rules that change a number of variables into a fuzzy result; that is, the result is characterized in terms of membership in fuzzy sets. 

Consequently, the fuzzy result can be thought of as a fuzzy set. For instance, the results of using criteria designed to decide how much pressure to apply could be Decrease Pressure by 15%, Maintain Pressure by 34%,and Increase Pressure by 72%. The term defuzzification refers to the process of translating the membership degrees of fuzzy sets into a concrete choice or actual value. The center of gravity method is a well-known and effective method for defuzzification. 
To begin, the outcomes of the rules have to be combined in some fashion by addition. The graph of a triangle is the one that appears most frequently in fuzzy set membership functions. 

#Fuzzy Rules

A fuzzy rule is a statement of the form 'If X is A, then Y is B',where X and Y are variables, and A and B are fuzzy sets."),

The decision-making process of humans is modeled with the help of fuzzy rules. They come in particularly handy in circumstances in which there is a degree of ambiguity or imprecision in the data. When there are a lot of different factors to take into consideration,
fuzzy rules might be helpful in making decisions on what to do.

When compared to other approaches to AI, fuzzy rules offer a number of benefits. They are simple to comprehend and interpret,
and it is not difficult to make adjustments to them or make additions to their scope. Additionally, fuzzy rules are more robust than other methods,
which means they are less likely to be influenced by shifts in the data.

In general, applications of AI can benefit greatly from the utilization of fuzzy rules as a strong tool. They are simple to comprehend and interpret,
which makes them an invaluable tool for decision-making in difficult circumstances."
