USE [HRMS_DB]
GO
/****** Object:  Table [dbo].[BusinessType]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessType](
	[BusinessTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessTypeName] [nvarchar](150) NOT NULL,
	[BusinessTypeDescription] [nvarchar](350) NULL,
 CONSTRAINT [PK_BusinessType] PRIMARY KEY CLUSTERED 
(
	[BusinessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommonTitle]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommonTitle](
	[CommonTitleID] [int] NOT NULL,
	[CommonTitleName] [nvarchar](20) NOT NULL,
	[CommonTitleDescription] [nvarchar](350) NULL,
 CONSTRAINT [PK_CommonTitle] PRIMARY KEY CLUSTERED 
(
	[CommonTitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] NOT NULL,
	[BusinessTypeID] [int] NOT NULL,
	[CompanyName] [nvarchar](150) NOT NULL,
	[CRNumber] [nvarchar](20) NULL,
	[VATNumber] [nvarchar](20) NULL,
	[AddressLine1] [nvarchar](50) NULL,
	[AddressLine2] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[ProvinceName] [nvarchar](50) NULL,
	[ZipCode] [varchar](10) NULL,
	[CityName] [nvarchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [nvarchar](250) NULL,
	[Website] [nvarchar](250) NULL,
	[CompanyLogo] [image] NULL,
	[IsCompanyVerified] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [varchar](3) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[DepartmentName] [nvarchar](150) NOT NULL,
	[DepartmentDescription] [nvarchar](350) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designations]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designations](
	[DesignationID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[DesignationName] [nvarchar](50) NOT NULL,
	[DesignationDescription] [nvarchar](350) NULL,
 CONSTRAINT [PK_Designations] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[EmployeeCode] [nvarchar](20) NOT NULL,
	[CommonTitleID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[GenderID] [int] NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[NationalityID] [int] NULL,
	[ReligionID] [int] NULL,
	[MaritalStatusID] [int] NULL,
	[ResidenceID] [varchar](20) NULL,
	[ResidenceIDExpired] [date] NULL,
	[Passport] [nvarchar](20) NULL,
	[PassportExpired] [date] NULL,
	[DrivingLicenseID] [varchar](20) NULL,
	[DrivingLicenseExpired] [date] NULL,
	[MedicalInsuranceCompanyName] [nvarchar](150) NULL,
	[MedicalInsurancePolicyType] [nvarchar](5) NULL,
	[MedicalInsuranceMemberID] [nvarchar](20) NULL,
	[IBAN] [nvarchar](24) NULL,
	[BankName] [nvarchar](50) NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Linkedin] [nvarchar](250) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[UserID] [int] NOT NULL,
	[CreatedUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdateUserID] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesAddress]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesAddress](
	[EmployeeAddressID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[AddressLine1] [nvarchar](150) NOT NULL,
	[AddressLine2] [nvarchar](250) NULL,
	[CityName] [nvarchar](100) NOT NULL,
	[ZipCode] [nvarchar](10) NULL,
	[ProvinceName] [nvarchar](100) NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesAddress] PRIMARY KEY CLUSTERED 
(
	[EmployeeAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesEmployment]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesEmployment](
	[EmploymentID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EmploymentTypeID] [int] NOT NULL,
	[HireDate] [datetime] NOT NULL,
	[JoinDate] [datetime] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[DesignationID] [int] NOT NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK_EmployeesEmployment] PRIMARY KEY CLUSTERED 
(
	[EmploymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesLeave]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesLeave](
	[EmployeeLeaveID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[LeaveTypeID] [int] NOT NULL,
	[NoOfDaysLeave] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesLeave] PRIMARY KEY CLUSTERED 
(
	[EmployeeLeaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesPayroll]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesPayroll](
	[EmployeePayrollID] [int] IDENTITY(1,1) NOT NULL,
	[PayrollTypeID] [int] NOT NULL,
	[PayrollAmount] [money] NOT NULL,
	[PayrollSequenceID] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesPayroll] PRIMARY KEY CLUSTERED 
(
	[EmployeePayrollID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmploymentType]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmploymentType](
	[EmploymentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[EmploymentTypeName] [nvarchar](50) NOT NULL,
	[EmploymentTypeDescription] [nvarchar](350) NULL,
 CONSTRAINT [PK_ContractType] PRIMARY KEY CLUSTERED 
(
	[EmploymentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[GenderID] [int] NOT NULL,
	[GenderName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveTypes]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTypes](
	[LeaveTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[LeaveTypeName] [nvarchar](150) NOT NULL,
	[LeaveTypeDescription] [nvarchar](350) NULL,
	[IsPayable] [bit] NOT NULL,
	[GenderID] [int] NULL,
	[EmploymentTypeID] [int] NULL,
 CONSTRAINT [PK_LeaveTypes] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaritalStatus]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaritalStatus](
	[MaritalStatusID] [int] IDENTITY(1,1) NOT NULL,
	[MaritalStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MaritalStatus] PRIMARY KEY CLUSTERED 
(
	[MaritalStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[NationalityID] [int] IDENTITY(1,1) NOT NULL,
	[NationalityName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[NationalityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayrollSequence]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollSequence](
	[PayrollSequenceID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[PayrollSequenceName] [nvarchar](50) NOT NULL,
	[PayrollSequenceDescription] [nvarchar](350) NULL,
 CONSTRAINT [PK_PayrollSequence] PRIMARY KEY CLUSTERED 
(
	[PayrollSequenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayrollTypes]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollTypes](
	[PayrollTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[PayrollTypeName] [nvarchar](50) NOT NULL,
	[PayrollTypeDescription] [nvarchar](350) NULL,
	[IsAllowance] [bit] NOT NULL,
 CONSTRAINT [PK_PayrollTypes] PRIMARY KEY CLUSTERED 
(
	[PayrollTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[ProjectName] [nvarchar](150) NOT NULL,
	[ProjectDescription] [nvarchar](350) NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Religions]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religions](
	[ReligionID] [int] IDENTITY(1,1) NOT NULL,
	[ReligionName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Religions] PRIMARY KEY CLUSTERED 
(
	[ReligionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[UserRoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06/09/2024 7:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserRoleID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[UserFullName] [nvarchar](150) NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[PasswordExpired] [datetime] NULL,
	[OTP] [nvarchar](5) NULL,
	[OTP_Expired] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_BusinessType] FOREIGN KEY([BusinessTypeID])
REFERENCES [dbo].[BusinessType] ([BusinessTypeID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_BusinessType]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Country]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Company]
GO
ALTER TABLE [dbo].[Designations]  WITH CHECK ADD  CONSTRAINT [FK_Designations_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Designations] CHECK CONSTRAINT [FK_Designations_Company]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_CommonTitle] FOREIGN KEY([CommonTitleID])
REFERENCES [dbo].[CommonTitle] ([CommonTitleID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_CommonTitle]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Company]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Genders] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Genders] ([GenderID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Genders]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_MaritalStatus] FOREIGN KEY([MaritalStatusID])
REFERENCES [dbo].[MaritalStatus] ([MaritalStatusID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_MaritalStatus]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Nationality] FOREIGN KEY([NationalityID])
REFERENCES [dbo].[Nationality] ([NationalityID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Nationality]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Religions] FOREIGN KEY([ReligionID])
REFERENCES [dbo].[Religions] ([ReligionID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Religions]
GO
ALTER TABLE [dbo].[EmployeesAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesAddress_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeesAddress] CHECK CONSTRAINT [FK_EmployeesAddress_Employees]
GO
ALTER TABLE [dbo].[EmployeesEmployment]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesEmployment_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[EmployeesEmployment] CHECK CONSTRAINT [FK_EmployeesEmployment_Department]
GO
ALTER TABLE [dbo].[EmployeesEmployment]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesEmployment_Designations] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[Designations] ([DesignationID])
GO
ALTER TABLE [dbo].[EmployeesEmployment] CHECK CONSTRAINT [FK_EmployeesEmployment_Designations]
GO
ALTER TABLE [dbo].[EmployeesEmployment]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesEmployment_Employees] FOREIGN KEY([EmploymentID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeesEmployment] CHECK CONSTRAINT [FK_EmployeesEmployment_Employees]
GO
ALTER TABLE [dbo].[EmployeesEmployment]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesEmployment_EmploymentType] FOREIGN KEY([EmploymentTypeID])
REFERENCES [dbo].[EmploymentType] ([EmploymentTypeID])
GO
ALTER TABLE [dbo].[EmployeesEmployment] CHECK CONSTRAINT [FK_EmployeesEmployment_EmploymentType]
GO
ALTER TABLE [dbo].[EmployeesLeave]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesLeave_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeesLeave] CHECK CONSTRAINT [FK_EmployeesLeave_Employees]
GO
ALTER TABLE [dbo].[EmployeesLeave]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesLeave_LeaveTypes] FOREIGN KEY([LeaveTypeID])
REFERENCES [dbo].[LeaveTypes] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[EmployeesLeave] CHECK CONSTRAINT [FK_EmployeesLeave_LeaveTypes]
GO
ALTER TABLE [dbo].[EmployeesPayroll]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesPayroll_PayrollSequence] FOREIGN KEY([PayrollSequenceID])
REFERENCES [dbo].[PayrollSequence] ([PayrollSequenceID])
GO
ALTER TABLE [dbo].[EmployeesPayroll] CHECK CONSTRAINT [FK_EmployeesPayroll_PayrollSequence]
GO
ALTER TABLE [dbo].[EmployeesPayroll]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesPayroll_PayrollTypes] FOREIGN KEY([PayrollTypeID])
REFERENCES [dbo].[PayrollTypes] ([PayrollTypeID])
GO
ALTER TABLE [dbo].[EmployeesPayroll] CHECK CONSTRAINT [FK_EmployeesPayroll_PayrollTypes]
GO
ALTER TABLE [dbo].[EmploymentType]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentType_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[EmploymentType] CHECK CONSTRAINT [FK_EmploymentType_Company]
GO
ALTER TABLE [dbo].[LeaveTypes]  WITH CHECK ADD  CONSTRAINT [FK_LeaveTypes_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[LeaveTypes] CHECK CONSTRAINT [FK_LeaveTypes_Company]
GO
ALTER TABLE [dbo].[LeaveTypes]  WITH CHECK ADD  CONSTRAINT [FK_LeaveTypes_EmploymentType] FOREIGN KEY([EmploymentTypeID])
REFERENCES [dbo].[EmploymentType] ([EmploymentTypeID])
GO
ALTER TABLE [dbo].[LeaveTypes] CHECK CONSTRAINT [FK_LeaveTypes_EmploymentType]
GO
ALTER TABLE [dbo].[LeaveTypes]  WITH CHECK ADD  CONSTRAINT [FK_LeaveTypes_Genders] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Genders] ([GenderID])
GO
ALTER TABLE [dbo].[LeaveTypes] CHECK CONSTRAINT [FK_LeaveTypes_Genders]
GO
ALTER TABLE [dbo].[PayrollSequence]  WITH CHECK ADD  CONSTRAINT [FK_PayrollSequence_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[PayrollSequence] CHECK CONSTRAINT [FK_PayrollSequence_Company]
GO
ALTER TABLE [dbo].[PayrollTypes]  WITH CHECK ADD  CONSTRAINT [FK_PayrollTypes_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[PayrollTypes] CHECK CONSTRAINT [FK_PayrollTypes_Company]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Company]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Company]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Company]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([UserRoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRole]
GO
