
typedef enum bit {
	TRUE = 1,
	FALSE = 0
} bool;

typedef enum {MASTER, SLAVE} agent_kind_t;

// the typedef enum of master agent name
typedef enum {M0} master_name_t;

// the typedef enum of slave agent name
typedef enum {
	S0 = 'h0,
	S1 = 'h1,
	S2 = 'h2,
	S3 = 'h3,
	S4 = 'h4,
	S5 = 'h5,
	S6 = 'h6
} slave_name_t;
