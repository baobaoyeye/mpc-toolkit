#pragma once

#include <stdint.h>
#include "mpct/common/executor.hpp"

class Party {
 public:
  Party();
  ~Party();
 private:
  uint32_t party_id;
  Executor* executor;
};