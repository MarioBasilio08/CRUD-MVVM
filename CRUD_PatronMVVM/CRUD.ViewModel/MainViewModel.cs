using CRUD.Model;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using static System.Net.Mime.MediaTypeNames;

namespace CRUD.ViewModel
{
    public class MainViewModel : ViewModelBase
    {
        private int id;
        private int age;
        private string name;
        private string email;
        private ObservableCollection<Person> lista;
        ListPerson personas;

        private Person selectedPerson;

        private bool isButtonEnabled;

        private bool isTextBoxEnabled;

        private ICommand saveCommand;
        private ICommand deleteCommand;
        private ICommand newCommand;

        private ICommand doubleClickCommand;

        public ICommand DoubleClickCommand
        {
            get
            {
                if (doubleClickCommand == null)
                {
                    doubleClickCommand = new RelayCommand(ExecuteDoubleClick);
                }
                return doubleClickCommand;
            }
        }

        public bool IsButtonEnabled
        {
            get { return isButtonEnabled; }
            set
            {
                isButtonEnabled = value;
                OnPropertyChanged(); 
            }
        }

        public bool IsTextBoxEnabled
        {
            get { return isTextBoxEnabled; }
            set
            {
                isTextBoxEnabled = value;
                OnPropertyChanged();
            }
        }

        public Person SelectedPerson
        {
            get { return selectedPerson; }
            set
            {
                selectedPerson = value;
                OnPropertyChanged();
            }
        }

        public int Id
        {
            get { return id; }
            set
            {
                id = value;
                OnPropertyChanged("Id");
            }
        }

        public int Age
        {
            get { return age; }
            set
            {
                age = value;
                OnPropertyChanged("Age");
            }
        }

        public string Name
        {
            get { return name; }
            set { 
                name = value; 
                OnPropertyChanged("Name");
            }
        }

        public string Email
        {
            get { return email; }
            set
            {
                email = value;
                OnPropertyChanged("Email");
            }
        }

        public ObservableCollection<Person> Lista
        {
            get { return lista; }
            set
            {
                lista = value;
                OnPropertyChanged(nameof(lista));
            }
        }

        public ICommand DeleteCommand
        {
            get
            {
                if (deleteCommand == null)
                {
                    deleteCommand = new RelayCommand(p => this.Delete());
                }
                return deleteCommand;
            }
        }

        public ICommand SaveCommand
        {
            get
            {
                if (saveCommand == null)
                {
                    saveCommand = new RelayCommand(p => this.Save());
                }
                return saveCommand;
            }
        }

        public ICommand NewCommand
        {
            get
            {
                if (newCommand == null)
                {
                    newCommand = new RelayCommand(p => this.New());
                }
                return newCommand;
            }
        }

        public MainViewModel()
        {
            Lista = new ObservableCollection<Person>();
            personas = new ListPerson();
            IsButtonEnabled = true;
            isTextBoxEnabled = true;

            Person person1 = new Person(1, "Mario Andres", 23, "andres@gmail.com");
            Person person2 = new Person(2, "Guillermo Eduardo", 23, "guillermo@gmail.com");
            Person person3 = new Person(3, "Samuel Erasto", 23, "samuel@gmail.com");
            Person person4 = new Person(4, "Jose Ricardo", 23, "jose@gmail.com");
            Person person5 = new Person(5, "Jose Alejandro", 23, "alejandro@gmail.com");

            Lista.Add(person1);
            Lista.Add(person2);
            Lista.Add(person3);
            Lista.Add(person4);
            Lista.Add(person5);

            personas.PersonAdded += PersonAddedChange;
            personas.PersonEdit += PersonEditChange;

        }

        public void Save()
        {
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) ||
                          id <= 0 || age <= 0)
            {
                MessageBox.Show("Hay campos erroneos o incompletos, por favor revise todos los campos.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                Person persona = new Person(id, name, age, email);
                
                if (personas.SearchPerson(Lista, id) != -1)
                {
                    MessageBoxResult result = MessageBox.Show("¿Seguro que desea editar la información?", "Confirmación", MessageBoxButton.YesNo, MessageBoxImage.Question);

                    if (result == MessageBoxResult.Yes)
                    {
                        personas.EditPerson(Lista, persona);
                        Limpiar();
                        IsButtonEnabled = true;
                        IsTextBoxEnabled = true;
                    }

                }
                else
                {
                    if (personas.AgregarPersona(Lista, persona))
                    {
                        Limpiar();
                    }
                    else
                    {
                        MessageBox.Show($"El Id: {persona.id} ya se encuentra registrado", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }

            }

        }

        public void Delete()
        {
            if (SelectedPerson != null)
            {
                                MessageBoxResult result = MessageBox.Show("¿Seguro que desea eliminar la información?", "Confirmación", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                if (result == MessageBoxResult.Yes)
                {
                    personas.EliminarPersona(Lista, SelectedPerson.id);
                }
                else
                {
                    SelectedPerson = null;
                }
            }
            else
            {
                MessageBox.Show($"No hay ningun elemento seleccionado", "Error", MessageBoxButton.OK, MessageBoxImage.Error);

            }
        }

        private void ExecuteDoubleClick(object parameter)
        {
            if (SelectedPerson != null)
            {
                id = SelectedPerson.id;
                OnPropertyChanged("Id");

                age = SelectedPerson.age;
                OnPropertyChanged("Age");

                name = SelectedPerson.name;
                OnPropertyChanged("Name");

                email = SelectedPerson.email;
                OnPropertyChanged("Email");

                IsButtonEnabled = false;
                IsTextBoxEnabled = false;
            }
        }

        public void New()
        {
            IsButtonEnabled = true;
            SelectedPerson = null;
            IsTextBoxEnabled = true;
            Limpiar();
        }

        public void Limpiar()
        {
            id = 0;
            OnPropertyChanged("Id");

            age = 0;
            OnPropertyChanged("Age");

            name = null;
            OnPropertyChanged("Name");

            email = null;
            OnPropertyChanged("Email");
        }

        public void PersonAddedChange(object s, Person e)
        {
            MessageBox.Show($"Se ha agredado una nueva persona {e.id}-{e.name}", "Información", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        public void PersonEditChange(object s, Person e)
        {
            MessageBox.Show($"Se editado la persona {e.id}-{e.name}", "Información", MessageBoxButton.OK, MessageBoxImage.Information);
        }
    }
}
