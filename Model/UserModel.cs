namespace AssignmentNew.Model
{
    public class UserLoginDetails
    {
        public string UserName { get; set; }
        public string UserPassword { get; set; }
    }

    public class UserPersonalDetails : UserLoginDetails
    {
        public string FirstName { get; set; }
    }
}