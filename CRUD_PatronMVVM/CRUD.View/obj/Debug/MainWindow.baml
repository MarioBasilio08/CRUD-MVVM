   M S B A M L   `   `   `  ����I  ECRUD.ViewModel, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG4clr-namespace:CRUD.ViewModel;assembly=CRUD.ViewModelCRUD.ViewModel  5   	   D @CRUD.View, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:CRUD.View	CRUD.View 5
   	      CRUD.View.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   =vm4clr-namespace:CRUD.ViewModel;assembly=CRUD.ViewModel  5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5   	   #localclr-namespace:CRUD.View  5
   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)    � 	Resources 5      "   CRUD.ViewModel.MainViewModel   MainViewModel��%   &	          5   
   63   5      .��5      �  � DataContext 6   ��  �� Source# [   � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��2* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��3* �6   .+�5   
   � $��0��6   $��0��6   
����ح�.+�5      �  � Cursor$  ��6    5       �� 5!      $��* �6'   �� 5"      $��3* �6'    5$      �� 5%      $��* �6$   �� 5&      $��* �6$   .+�5(      �� $��0��6   $��0��6%   $	��Id:��65   $��Center=�6C   $��Center=�6`   �� 5)      $��1��6   $��0��6%   $��Edad:��65   $��Center=�6E   $��Center=�6b   �� 5*      -   5         ��Name$ TextId��5*      $��0��6*   $��1��67   $��Center=�6G    �� TextWrapping$
 Wrap=�6d   $��Center=�6x   $	��120��6�   )  #MaterialDesignThemes.Wpf.HintAssist	   Hint$	 0��6�   $  ��6"  ��6�   �� *Id+
 �� UpdateSourceTrigger$
 PropertyChanged=�{�6�   �� *IsTextBoxEnabled+6"  �� 5+      -   5        $ TextAge��5+      $��1��6+   $��1��68   $��Center=�6H   $
 Wrap=�6e   $��Center=�6y   $	��120��6�   $	 18��6�   ��6�   �� *Age+$
 PropertyChanged=�6   5,      5-      � 5/   
   $��1��6   $��0��6   
�������.+�50      �  51      �� 52      $��* �6'   �� 53      $��4* �6'    55      �� 56      $��* �6$   �� 57      $��* �6$   .+�59      �� $��0��6   $��0��6%   $��Nombre:��65   $��Center=�6G   $��Center=�6d   �� 5:      $��1��6   $��0��6%   $��Email:��65   $��Center=�6F   $��Center=�6c   �� 5;      -   5        $ TextName��5;      $��0��6,   $��1��69   $��Center=�6I   $
 Wrap=�6f   $��Center=�6z   $	��360��6�   $	 Andrés Basilio��6�   ��6�   �� *Name+$
 PropertyChanged=�6�   �� 5<      -   5        $ 	TextEmail��5<      $��1��6-   $��1��6:   $��Center=�6J   $
 Wrap=�6g   $��Center=�6{   $	��360��6�   $	 andres.basilio@outlook.es��6�   $  ��6  ��6�   �� *Email+$
 PropertyChanged=�6  5=      5>      � 5@   
   $��0��6   $��1��6   $��2��6-   
������ 5A      �� 5B      $��3* �6#   �� 5C      $	��.8* �6#   .+�5F      &   System.Windows.Controls.DataGrid  -   5          Name$ 	dgPersons��5F   ]      AutoGenerateColumns .     CanUserAddRows .     
IsReadOnly . ��6   �� *Lista+ �� SelectedItem 65   �� *SelectedPerson+*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5G      +  %Microsoft.Xaml.Behaviors.EventTrigger  5H         	EventName$ MouseDoubleClick��6%   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5I      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 60   �� *DoubleClickCommand+5J         Columns 5M      0  *System.Windows.Controls.DataGridTextColumn  5N      ,	  &System.Windows.Controls.DataGridColumn 	  Header$ ID��6)    	  Width5
  /System.Windows.Controls.DataGridLengthConverter$ *
 65   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6?   �� *id+  5O      $ Nombre��6)   $ 4*
 69    6D   �� *name+  5P      $
 Edad��6)   $ *
 68    6B   �� *age+  5Q      $ Email��6)   $ 4*
 69    6D   �� *email+5T      � 5V      $��1��6    5W      �� 5X      $��* �6$   �� 5Y      $��* �6$   �� 5Z      $��* �6$   .+�5\      �� -   5         ��Name$ BGuardar��5\      $��0��6+   $��Center=�68   $��Center=�6U   ��6p   �� *SaveCommand+.��5]      ��  �� Orientation$ 
Horizontal=�6!   $��Center=�6:   .+�5^      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ ContentSave=�62   $��0,0,5,0q�6E   �� 5_      $��Guardar��6$   5`      5a      �� 5b      -   5        $ BNuevo��5b      $��1��6)   $��Center=�66   $��Center=�6S   ��6n   �� *
NewCommand+.��5c      �� $ 
Horizontal=�6!   $��Center=�6:   .+�5d        $ NewBox=�62   $��0,0,5,0q�6@   �� 5e      $��Nuevo��6$   5f      5g      �� 5h      -   5        $ 	BEliminar��5h      $��2��6,   $��Center=�69   $��Center=�6V   ��6q   �� *DeleteCommand+{�6�   �� *IsButtonEnabled+.��5i      �� $ 
Horizontal=�6!   $��Center=�6:   .+�5j        $ Delete=�62   $��0,0,5,0q�6@   �� 5k      $��Eliminar��6$   5l      5m      5o      5q      5t      5u      