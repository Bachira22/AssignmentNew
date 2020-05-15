namespace AssignmentNew.Model
{
    public class UserLoginDetails
    {
        public int? UserId { get; set; }
        public string UserName { get; set; }
        public string UserPassword { get; set; }

    }

    public class UserPersonalDetails : UserLoginDetails
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public char Gender {get; set; }
        public string Address {get; set; }
        public long MobileNumber {get; set; }
        public int ProfessionId {get; set; }

    }
}