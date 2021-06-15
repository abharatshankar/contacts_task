# contacts_task

1. Architecture used for this task is Bloc Pattern and clean architecture for folder structure

2. used packages for this task:
  grouped_list: ^4.0.0
  flutter_bloc: ^7.0.1
  equatable: ^2.0.3
  
Equatable package is used for value comaparison

flutter_bloc is for state management inorder to seperate businesslogic and presentation layer 

grouped_list is used for listing contact names segregated with alphabatical order

To get that animation effect for header view i used slivers : in slivers i used customscrollview inorder to get the animation effect 

I added header and footer as widgets on top and bottom with a container with name and icon

While we implement search filtering at that time i am validating with textfield text with original list then we can get the result array that array will be reflected in listview otherwise original listview will be displayed

