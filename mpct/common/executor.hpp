#pragma once

#include <vector>

#include "mpct/common/task.hpp"

class Executor {
 public:
  virtual ~Executor() = default;
  virtual void execute(const Task& task);
  virtual void executeAll(const Task& task);
};

class PlainExecutor : public Executor {
 public:
  virtual ~PlainExecutor() = default;
};

class SecureExecutor : public Executor {
 public:
  virtual ~SecureExecutor() = default;
};